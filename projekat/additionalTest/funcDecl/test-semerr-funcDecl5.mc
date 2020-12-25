//Testiranje semantičkih gresaka prilikom deklaracije

int fun1(int a,int b,int c);
int fun2(int a, int b);

int main(){

	int a,b,c;
	
	a = fun1(1,2,3);
	b = fun2(1,2);
	
	return a;
}
unsigned fun1(int a, int b, int c){             //Redefinisana funkcija nema isti povratni tip
	return 5u;
}
int fun2(int a, int b){
	return 5;
}
