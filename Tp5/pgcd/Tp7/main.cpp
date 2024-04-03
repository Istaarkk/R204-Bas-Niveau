#include <iostream>
using namespace std;

extern "C" int pgcd(int a, int b);

int main()
{
	int a;
	int b;
	
	cout << "Entrez un premier entier : "; cin >> a;
	cout << "Entrez un deuxieme entier : "; cin >> b;
	
	cout << a << " pgcd " "de "<<a <<"et " << b << " = " << pgcd(a, b) << endl;
	
	return 0;
}