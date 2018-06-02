#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

#ifdef _WIN32 // sprawdzanie czy jest to windows czy linux
#include <winsock2.h>
#else
#include <sys/socket.h>
#include <arpa/inet.h>
#include <string.h>
#endif

int main(int argc , char *argv[]) {
    if(argc <= 2 || argc > 3) {     // sprawdzanie czy zostały podane dwa argumenty adres IP oraz port serwera
        printf("Problem podczas uruchamiania klienta!\n");
        return 0;
    }
    int socket_desc = -1;
#ifdef _WIN32   // sprawdzanie czy jest to windows, jeżeli tak to wykonuje inicjalizacje socketu dla systemu windows
    WSADATA wsa_data;
    WSAStartup(MAKEWORD(1,1), &wsa_data);
#endif
    struct sockaddr_in server;
    char odpowiedz_serwera[3000];
    socket_desc = socket(AF_INET , SOCK_STREAM , 0); // gniazdo strumieniowe (transmisja TCP)
    if (socket_desc == -1){
        printf("Nie moge utworzyc gniazda \n");
    }
    //adres serwera zdalnego
    server.sin_addr.s_addr = inet_addr(argv[1]);    //ustawianie IP serwera podane jako parametr podczas uruchomiania klienta
    server.sin_family = AF_INET;
    server.sin_port = htons( atoi(argv[2]) );   //ustawianie portu serwera podane jako parametr podczas uruchomiania klienta
    //Polacz z serwerem zdalnym (TCP)
    if (connect(socket_desc , (struct sockaddr *)&server , sizeof(server)) < 0) { //nawiazywanie polaczenia z serwerem oraz sprawdzanie czy udalo sie polaczyc
        puts("Blad polaczenia\n");
        return 1;
    }
    puts("Polaczono z serwerem\n");
    sleep (1);
    while (1) {
//        //Nasluchiwanie i odbior danych z serwera (TCP)
        if( recv(socket_desc, odpowiedz_serwera , 3000 , 0) < 0) {    // odbior danych z serwera
            puts("Blad odbioru danych\n");
        }
        if(strstr(odpowiedz_serwera, "wylacz") != NULL) { //sprawdzanie czy przyszla komenda wylaczenia komputera
        #ifdef _WIN32 // sprawdzanie czy jest to windows czy linux
            system("C:\\WINDOWS\\System32\\shutdown /s /t 0"); // wylaczanie komputera dla windowsa
        #else
            system("shutdown -P now");  // wylacznie komputera dla linuxa
        #endif
	        break;
        }
    }
    close(socket_desc);
    return 0;
}
