#include <stdio.h>
#include <ctype.h>
#include <fcntl.h>
#include "../lib/tlpi_hdr.h"

#ifndef BUF_SIZE
#define BUF_SIZE 1024
#endif

int main( int argc, char *argv[])
{

	/* The "tee" command reads its standard input until end-of-file, 
	 * writing a copy of the input to standard output and to the file
	 * named in its command-line argument.*/

	int fd, STDINfd, STDOUTfd;
	int opt;
	int OpenFlags;
	ssize_t numRead, numWriteOUT, numWriteFD;
	char buf[BUF_SIZE];
	
	if (argc < 2 || strcmp(argv[1], "--help") == 0)
		usageErr("%s file", argv[0]);
	
	/* By default, "tee" overwrites any existing file with the given
	 * name. Implement the "-a" command-line option (tee -a file),
	 * which causes "tee" to append text to the end of a file if it 
	 * already exists. */

	while ( (opt = getopt(argc, argv, ":a:")) != -1)
		switch(opt)
		{
			case 'a':
				OpenFlags = O_WRONLY | O_CREAT | O_APPEND;
			   	break;
			default :
				OpenFlags = O_WRONLY | O_CREAT | O_TRUNC;	
		}


	STDINfd = 0;
	STDOUTfd = 1;
	
	fd = open(argv[1], OpenFlags, 
			S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP |
			S_IROTH | S_IWOTH);
	if ( fd == -1)
		errExit("open");

	while( (numRead = read(STDINfd, buf, BUF_SIZE)) != 0)
		if (numRead == -1)
			errExit("read");

		if ( (numWriteOUT = write(STDOUTfd, buf, BUF_SIZE)) != numRead)
			fatal("Couldn't write whole buffer to stdout");

		if ( (numWriteFD = write(fd, buf, BUF_SIZE)) != numRead)
			fatal("Couldn't write whole buffer to file");

	
	printf("stdout: wrote %ld bytes", numRead);
	printf("%s: wrote %ld bytes", argv[1], numRead);
	

	return EXIT_SUCCESS;

}
