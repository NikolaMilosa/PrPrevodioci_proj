//Testiranje deklaracije funkcije
//RETURN: 11

int fun(int b,int c,int a){
	b = c + a;
	
	return b;
}

int main(){

	int a,b,c;
	
	a = fun(0,3,8);
	
	return a;
}


