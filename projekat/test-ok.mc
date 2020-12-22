//Testiranje deklaracije funkcije
//RETURN: 11

int fun(int b,int c,int a){
	int e;
	
	e = a + b + c;
	
	return e;
}

int main(){

	int a,b,c;
	
	b = 3;
	c = 8;
	
	a = fun(0,b,c);
	
	return a;
}


