#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const int SIZEOS = 50;
const int SIZEOS2 = 1024;
const int SIZECPU = 4096;
const int SIZETECH = 8192;

char* get_name_os_linux()
{
  FILE *fp;
  char* buffer = malloc(SIZEOS);
  fp = popen("lsb_release -ds", "r");
  fgets(buffer, SIZEOS, fp);
  pclose(fp);
  printf("%ld\n", strlen(buffer));
  if(strlen(buffer) < 7) {
    fp = popen("cat /etc/*-release", "r");
    fgets(buffer, SIZEOS, fp);
    pclose(fp);
  }
//  printf("Name of the OS is :\n %s", buffer);
  return buffer;
}

char* get_name_os2_linux()
{
  int i, ch;
  FILE *fp;

  char* buffer = malloc(SIZEOS2);
  fp = popen("cat /etc/*-release", "r");

  ch = fgetc (fp);
  for(i=0; (i < SIZEOS2) && (feof(fp) == 0);i++)
  {
    buffer[i] = (char)ch;
    ch = fgetc (fp);
  }
  buffer[i] = '\0';
  pclose(fp);
//  printf("\n %s", buffer);
  return buffer;
}

char* get_name_cpu_linux()
{
  int i, ch;
  FILE *fp;

  char* buffer = malloc(SIZECPU);
  fp = popen("cat /proc/cpuinfo", "r");

  ch = fgetc (fp);
  for(i=0; (i<SIZECPU) && (feof(fp) == 0);i++)
  {
    buffer[i] = (char)ch;
    ch = fgetc (fp);
  }
  buffer[i] = '\0';
  pclose(fp);
//  printf("\n %s", buffer);
  return buffer;
}

char* get_name_architecture_linux()
{
  int i, ch;
  FILE *fp;

  char* buffer = malloc(SIZETECH);
  fp = popen("lscpu", "r");

  ch = fgetc (fp);
  for(i=0; (i<SIZETECH) && (feof(fp) == 0);i++)
  {
    buffer[i] = (char)ch;
    ch = fgetc (fp);
  }
  buffer[i] = '\0';
  pclose(fp);
//  printf("\n %s", buffer);
  return buffer;
}
