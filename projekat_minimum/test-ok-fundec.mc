//Testiranje deklaracije funkcije
//RETURN: 18

int fun(int b, int c, int a){
	b = c + c + a;
	
	return b;
}
int fun1(int b, int c){
	b = fun(0,0,0) + b + c;
	return b;
}

int main(){

	int a = 15,b = 3,c;
	
	
	a = fun1(3,3) + fun(0,3,8) + fun1(4,5) + fun(0,0,0);
	
	a = a + 1;
	
	return b + a;
}



