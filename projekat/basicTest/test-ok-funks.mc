//Testiranje deklaracije funkcije
//RETURN: 12

int fun(int b, int c, int a){

	b = b + c + a + c;
	
	return b;
}

int main(){

	int a,b,c;
	
	a = fun(2,3,4);
	
	return a;
}




