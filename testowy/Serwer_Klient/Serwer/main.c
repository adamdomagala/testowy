#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/mman.h>

#define MAX_CLIENTS 100

struct client {
    int numer_klienta;
    struct sockaddr client_ipv4[INET_ADDRSTRLEN];
    int client_desc;
};

char* wypisz_klientow(struct client *clients, int n);

int main(int argc , char *argv[]) {
    if(argc != 2) {
        printf("Problem podczas uruchamiania serwera!\n");
        return 0;
    }
    struct client *listaKlientow = mmap(0, MAX_CLIENTS*sizeof(struct client), PROT_READ|PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0); // zagospodarodorowanie pamieci do wspoldzielenia miedzy procesami
    int *num_clients = mmap(0, sizeof(int), PROT_READ|PROT_WRITE, MAP_SHARED|MAP_ANONYMOUS, -1, 0); // zagospodarodorowanie pamieci do wspoldzielenia miedzy procesami
    if (!listaKlientow) {
        perror("mmap failed");
        exit(1);
    }
    memset((void *)listaKlientow, 0, MAX_CLIENTS*sizeof(struct client)); // wypelnienie zerami pamieci współdzielonej
    int socket_desc , new_socket , c;
    struct sockaddr_in server , client;
    int read_size;
    //Utworz gniazdo
    socket_desc = socket(AF_INET , SOCK_STREAM , 0);
    if (socket_desc == -1)
    {
        printf("Could not create socket");
    }
    //Przygotuj addres gniazda
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;
    //server.sin_port = htons( 8885 ); //ustawianie portu
    server.sin_port = htons( argv[1] ); //ustawianie portu
    //Polacz deskrypor gniazda (gniazdo) z przypisanym adresem
    if( bind(socket_desc,(struct sockaddr *)&server , sizeof(server)) < 0)
    {
        puts("Problem dolaczenia gniazda");
        //return -1;
    }
    //Nasluchiwanie na gniezdzie (serwer)
    listen(socket_desc , 3);
    puts("SERWER TCP: Czekam na polaczenie...");
    c = sizeof(struct sockaddr_in);
    int pid;
    *num_clients = 0;
    while (1) {
        //Akceptuj polaczenie przychodzace
        new_socket = accept(socket_desc, (struct sockaddr *)&client, (socklen_t*)&c);
        if (new_socket<0)
        {
            perror("Problem z akceptacja poloczenia");
        }
        puts("Polaczenie zaakceptowane");
        //int enable = 1;
        //setsockopt(new_socket, SOL_SOCKET, SO_REUSEADDR, &enable, sizeof(int));
        struct client klient;
        klient.numer_klienta = *num_clients;   // przypisanie numeru klienta w liscie
        memcpy(&klient.client_desc, &new_socket, sizeof(new_socket)); // wstawienie deskryptora gniazda do odpwiedniej zmiennej struktury klienta
        struct sockaddr_in* ipV4Addr = (struct sockaddr_in*)&client;
        struct in_addr ipAddr = ipV4Addr->sin_addr;
        inet_ntop( AF_INET, &ipAddr, klient.client_ipv4, INET_ADDRSTRLEN ); // zapisanie adresu ip klienta w liscie
        memcpy(&listaKlientow[*num_clients], &klient, sizeof(klient)); // wstawienie do tablicy klientów danych o kliencie
        (*num_clients)++; // inkrementacja licznika klientów podłądczanych do serwera
        pid = fork(); //tworzenie nowego procesu, jezeli funkcja fork() zwróci 0 to jestesmy w procesie dziecka, jezeli zwróci wartosc > 0 to jestesmy w procesie macierzystym
        if (pid < 0) { // warunek sprawdzajacy czy udalo sie stworzyc nowy proces
            perror("ERROR in new process creation");
            _exit(1);
        }
        if (pid == 0) { // warunek sprawdzajacy czy jestesmy w procesie dziecka
            char client_message[3000];  // bufor wiadomosci z poleceniami od klienta
            int liczba = 0;
            memset(client_message, 0, 3000); // wypełnienie zerami bufora
            while (1) {
                memset(client_message, 0, 3000); // wypełnienie zerami bufora
                if((read_size = recv(new_socket, client_message, 3000, 0)) > 0) {   // odbieranie danych
                    liczba = atoi(client_message);  // zamiana odebranych danych na liczbe
                } else if(read_size == 0) {
                    puts("Klient sie rozlaczyl");
                    close(new_socket);  // zamkniecie gniazda
                    kill(getpid(), SIGKILL);    // zabicie procesu odpowiadajacego za polaczenie z klientem
                }
                if (liczba > 0) {   // sprawdzanie czy przyszedł numer klienta którego chcemy wyłączyć
                    liczba = liczba - 1; // poniewaz numery klientów są od 1 do n, a numerowanie tablicy jest od 0 do n-1
                    char *fff = "wylacz"; // polecenie do wylaczenia komputera
                    sendto(listaKlientow[liczba].client_desc, fff, sizeof(fff), 0, listaKlientow[liczba].client_ipv4, INET_ADDRSTRLEN); // wysłanie polecenia do klienta który ma zostać wyłączony
                }
                if (strstr(client_message, "komputery") != NULL) {    //sprawdzanie czy klient wyslal komende do zsumowania liczb
                    char *result = wypisz_klientow(listaKlientow, *num_clients); // wywolanie funkcji która przygotowuje liste klientów w postaci łańcucha znaków do wyświetlenia podłączonych klientów
                    write(new_socket, result, strlen(result)); //wysylanie odpowiedzi do klienta
                    free(result);   // zwolnienie zaalokowanej pamięci, która odbyła się w funkcji wypisz klientów
                } else {
                    char message[] = "Potwierdzenie odebrania danych przez serwer\n";
                    write(new_socket, message, strlen(message));    //wysylanie odpowiedzi do klienta
                }
            }
        }
    }
}

char* wypisz_klientow(struct client *clients, int n) {
    char *result = malloc(3000);    // zaalkowanie pamieci o rozmiarze 3000 bajtow
    memset(result, 0, sizeof(result)); // wyzerowanie zaalokowanej pamieci
    char cx[20];
    for(int i = 0; i < n; i++) {
        int len = strlen(result);   // sprawdzanie w kazdej iteracji rozmiaru bufora
        sprintf(cx, "%d - %s\n", clients[i].numer_klienta+1, clients[i].client_ipv4); // wpisanie danych o kliencie do tablicy znaków
        memcpy(&result[len], cx, sizeof cx); // dołączanie danych o kliencie do pozostałych
    }
    return result;
}