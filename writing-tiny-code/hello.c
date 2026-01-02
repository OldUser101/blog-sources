#include <unistd.h>

int main(void) {
	write(0, "hello world\n", 12);
	return 0;
}
