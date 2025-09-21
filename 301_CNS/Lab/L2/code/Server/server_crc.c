// Server side C/C++ program to demonstrate Socket programming
#include <stdio.h>
#include <sys/socket.h>
#include <stdlib.h>
#include <netinet/in.h>
#include <string.h>
#define G 13
#define PORT 8080
#define N strlen(g)
char t[28],cs[28],g[]="1101";
int a,e,c;
 
void xor(){
    for(c = 1;c < N; c++)
    cs[c] = (( cs[c] == g[c])?'0':'1');
}
 
void crc(){
    for(e=0;e<N;e++)
        cs[e]=t[e];
    do{
        if(cs[0]=='1')
            xor();
        for(c=0;c<N-1;c++)
            cs[c]=cs[c+1];
        cs[c]=t[e++];
    }while(e<=a+N-1);
}

int main(int argc, char const *argv[])
{
    int server_fd, new_socket, valread;
    int pid;
    struct sockaddr_in address;
    int opt = 1;
    int addrlen = sizeof(address);
    char buffer[1024] = {0};
    char hello[9],c[6];
      
    // Creating socket file descriptor
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0)
    {
        perror("socket failed");
        exit(EXIT_FAILURE);
    }
    printf("\nSocket created\n");
      
    // Forcefully attaching socket to the port 8080
    if (setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT,
                                                  &opt, sizeof(opt)))
    {
        perror("setsockopt");
        exit(EXIT_FAILURE);
    }
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons( PORT );
    printf("\nConnected to port 8080\n");
  
    // Forcefully attaching socket to the port 8080
    if (bind(server_fd, (struct sockaddr *)&address, 
                                 sizeof(address))<0)
    {
        perror("bind failed");
        exit(EXIT_FAILURE);
    }
    printf("\nbind complete\n");
    l1:
    if (listen(server_fd, 3) < 0)
    {
        perror("listen");
        exit(EXIT_FAILURE);
    }
    printf("\nlistening\n");
    if ((new_socket = accept(server_fd, (struct sockaddr *)&address, 
                       (socklen_t*)&addrlen))<0)
    {
        perror("accept");
        exit(EXIT_FAILURE);
    }

    	printf("\nEnter data : \n");
    	scanf("%s",t);
    	a=strlen(t);
    	printf("%d",a);
    	for(e=a;e<a+N-1;e++)
        	t[e]='0';
        crc();
    	printf("\nChecksum is : %s\n",cs);
    	for(e=a;e<a+N-1;e++)
        	t[e]=cs[e-a];
    	printf("\nFinal signal : %s\n",t);
    	printf("\nsend:\n 1-correct data \n 0-errerinious data\n ");
		scanf("%d",&e);
		if(e==0)
		{
		    do{
		        printf("\nEnter the position where error is to be inserted : \n");
		        scanf("%d",&e);
		    }while(e==0 || e>a+N-1);
		    t[e-1]=(t[e-1]=='0')?'1':'0';
		    printf("\nErroneous data : %s\n",t);
		}
	    send(new_socket , t , strlen(t) , 0 );

return 0;
}
