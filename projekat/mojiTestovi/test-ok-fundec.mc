//Testiranje deklaracije funkcije
//RETURN: 14

int fun(int b,int c,int a);
int fun1(int b, int c);

int main(){

	int a,b,c;
	
	a = fun(0,3,8);
	
	return a;
}

int fun(int b, int c, int a){
	b = c + c + a;
	
	return b;
}
int fun1(int b, int c){

	b = 5;
	
	return b;
}


