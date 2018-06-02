#include <stdio.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

int main(int argc , char *argv[])
{
    if(argc <= 2 || argc > 3) { // sprawdzanie czy podano dwa parametry: adres IP oraz port serwera
        printf("Problem podczas uruchamiania klienta!\n");
        return 0;
    }
    int socket_desc = -1;
    struct sockaddr_in server;
    char odpowiedz_serwera[3000];
    socket_desc = socket(AF_INET , SOCK_STREAM , 0); // gniazdo strumieniowe (transmisja TCP)
    if (socket_desc == -1){
        printf("Nie moge utworzyc gniazda \n");
    }
    //adres serwera zdalnego
    server.sin_addr.s_addr = inet_addr(argv[1]);    //ustawianie IP serwera podane jako parametr podczas uruchomiania klienta
    server.sin_family = AF_INET;
    //server.sin_port = htons( 8888 );    //ustawianie portu serwera
    server.sin_port = htons( atoi(argv[2]) );   //ustawianie portu serwera podane jako parametr podczas uruchomiania klienta
    //Polacz z serwerem zdalnym (TCP)
    if (connect(socket_desc , (struct sockaddr *)&server , sizeof(server)) < 0) { //nawiazywanie polaczenia z serwerem oraz sprawdzanie czy udalo sie polaczyc
        puts("Blad polaczenia\n");
        return 1;
    }
    puts("Polaczono z serwerem\n");
    sleep (1);
    while (1) {
        //wysylanie
        char message[3000];
        fgets(message, sizeof(message), stdin); // odczytanie wpisanych znakow z terminala
        if( send(socket_desc , message , strlen(message) , 0) < 0) { // wysylanie danych do serwera
            puts("Blad wyslania danych\n");
            return 1;
        }
        puts("Dane wyslano\n");
        //Nasluchiwanie i odbior danych z serwera (TCP)
        if( recv(socket_desc, odpowiedz_serwera , 3000 , 0) < 0){    // odbior danych z serwera
            puts("Blad odbioru danych\n");
        }
        puts(odpowiedz_serwera); // wyswietlenie odpowiedzi serwera
        memset (odpowiedz_serwera, 0, sizeof (odpowiedz_serwera));    //ustawienie wartosci 0 w buforze odpowiedzi serwera
        sleep (1);
    }
    close(socket_desc);
    return 0;
}