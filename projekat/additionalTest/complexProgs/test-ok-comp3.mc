//Testiranje kompleksnih programa:
//RETURN: 33

int fun1(int a, int b, int c){
	int e;
	
	check[e]{
		when 1 ->
			a = a + 2;
			finish;
		when 0 ->
			b = a;
		otherwise ->
			c = 3;
	}
	
	return a + b + c;
}

int main(){

	int a,b,c;
	unsigned e,f,g = 2u;
	
	check[f]{
		when 1u ->
			a = 2;
			finish;
		when 2u ->
			b = fun1(1,2,3) + a;
		when 3u ->
			check[e]{
				when 2u ->
					a = 3;
					finish;
				when 3u ->
					b = 22;
				otherwise ->
					b = 2;
			}
		when 4u ->
			b = 33;
			finish;
	}
	
	return b;
}
