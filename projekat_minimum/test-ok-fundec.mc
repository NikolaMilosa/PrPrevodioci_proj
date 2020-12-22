//Testiranje deklaracije funkcije
//RETURN: 23

int fun(int b, int c, int a){
	b = c + c + a;
	
	return b;
}
int fun1(int b, int c){
	b = fun(0,0,0) + b + c;
	return b;
}

int main(){

	int a,b,c;
	
	int e = fun(1,5,5) + fun1(2,3), f = fun(1,1,1);
	
	a = fun1(3,3) + fun(0,3,8) + fun1(4,5) + fun(0,0,0);
	
	return e + f;
}



