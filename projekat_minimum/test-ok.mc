//Testiranje deklaracije funkcije
//RETURN: 7

int fun(int b,int c,int a){
	b = c + a;
	
	return b;
}

int main(){

	int a,b = fun(1,1,1) + fun(1,1,1),c = 3;
	
	a = fun(0,3,8) + 5;
	
	return b + c;
}


