//Testiranje deklaracije funkcije
//RETURN: 10

int fun(int b, int c, int a){
	b = c + c + a;
	
	return b;
}
int fun1(int b, int c){
	b = fun(0,0,0) + b + c;
	return b;
}

int main(){

	int a = 3,b = 4,c = 5;
	
	int f = fun(0,1,9);	
	
	int k = (b + b) + (b == c) ? 1 : 2;
	
	a = fun1(3,3) + fun(0,3,8) + fun1(4,5) + fun(0,0,0);
	
	return k;
}



