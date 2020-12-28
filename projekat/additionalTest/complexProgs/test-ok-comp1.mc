//Testiranje na kompleksnijim programima:
//RETURN: 9


int fun(int a,int b,int c);

int main(){

	int a,b,c;
	unsigned e,f,g = 2u;
	
	int i;
	
	para(i = 3 : 4 : paso 1){
		check[i]{
			when 3 ->
				a = fun(1,1,1);
			when 4 ->
				b = fun(2,2,2) + a;
			otherwise ->
				c = fun(3,3,3);
		}
	}
	
	return c;
}

int fun(int a, int b, int c){
	a = a + b + c;
	return a;
}
