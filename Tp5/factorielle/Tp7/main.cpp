#include <iostream>
using namespace std;

extern "C" long long int factorielle(long long int a);

int main()
{
	long long int a;
	
	cout << "Entrez un premier entier : "; cin >> a;
	
	
	cout << a << " factorielle "  " = " << factorielle(a) << endl;
	
	return 0;
}