#include <iostream>
using namespace std;

extern "C" short int ppcm(short int a, short int b);

int main()
{
	short int a;
	short int b;
	
	cout << "Entrez un premier entier : "; cin >> a;
	cout << "Entrez un deuxieme entier : "; cin >> b;
	
	cout << a << " ppcm " "de "<<a <<"et " << b << " = " << ppcm(a, b) << endl;
	
	return 0;
}