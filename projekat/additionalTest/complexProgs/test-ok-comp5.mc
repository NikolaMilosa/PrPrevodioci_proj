//Testiranje programa kompleksnijeg koda :
//RETURN: 3

int fun(int a, int b, int c);
void f(int k, int p);

int main(){
	int a,b,c;
	unsigned e,f,g = 3u;
	
	int k = fun(1,2,3);
	
	para(a = 2 : 5 : paso 1){
		check[a]{
			when 3 ->
				b = fun(1,1,1);
			when 4 ->
				f = 4u;
				finish;
			otherwise ->
				check[b]{
					when 0 ->
						k = 15;
						finish;
					when 15 ->
						b = 3;
					otherwise ->
						k = 3;
				}
		}
	}
	--a;
	check[a]{
		when 2 ->
			para(b = 3 : 5 : paso 1)
				c++;
			finish;
		when 4 ->
			para(b = 2 : 3 : paso 1)
				check[b]{
					when 2 ->
						a = 3;
						finish;
					otherwise ->
						a = 5; 
				}
			finish;
		otherwise ->
			c = 10;
	}
	
	para(c = 0 : 5 : paso 1)
		para(b = 0 : 5 : paso 1)
			c = b + c;
	
	return a;
}

int fun(int a, int b, int c){
	return a + b + c;
}
void f(int k, int p){
	k = k + 1;
	return;
}
