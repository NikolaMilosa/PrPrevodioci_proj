//Testiranje deklaracije funkcije :
//RETURN: 5

unsigned fun1(int a, int b, int c);
unsigned fun2(int a, int b);

void normFun(int a, int b){
	int k,l;
	return 5;
}

int main(){

	int a,b,c;
	
	a = fun1(1,2,3);
	b = fun2(1,2);
	
	return a;	
}

int fun1(int a, int b, int c){
	a = 5;
	return a;
}
int fun2(int a, int b){
	b = 5;
	return b;
}
