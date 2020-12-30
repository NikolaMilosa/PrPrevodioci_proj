//Testiranje ko zna cega:
//RETURN: 17

int a,b,c;
unsigned f,d,e;

void vfunc(int a, int b){
	a = 5;
	c = 5;
	return;
}
int ifunc(int b, int d, unsigned c){
	b = 4;
	d = 2;
	c = 2u;
	a = 5;
	return b;
}

int main(){

	int b,c;
	unsigned d,e;
	
	b = 0;
	
	a = a + ifunc(1,2,2u);
	
	para(c = 0 : 5 : paso 1)
		a++;
		
	check[b]{
		when 0 ->
			a = a + 3;
			finish;
		when 1 ->
			b = 2;
		otherwise ->
			b = b + 2;
	}
	
	return a;
}
