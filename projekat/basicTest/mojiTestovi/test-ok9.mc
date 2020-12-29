//Testiranje para iskaza
int main(){

	int a,b,c;
	unsigned e,f,g;
	
	para(a = 5 : 10 : paso 1){
		c = 3;
		c = c + 3;
	}
	para(e = 2u : 10u : paso 1u){
		c = 3;
		c = c + 3;
	}
	
	para(b = 3 : 10 : paso 1){
		c = 0;
		para(c = 1 : 10 : paso 1)
			a = a + 5;
	}
	
	return 0;
}
