//Napredno testiranje para paso:
//RETURN: 18

int main(){

	int a,b,c;
	int e = 0,f,g = 2;
	
	para(a = 0 : 2 : paso 1)
		para(b = 0 : 2 : paso 1)
			para(c = 0 : 2 : paso 1)
				e = e + 1;
				
				
	para(a = 0 : 2 : paso 1)
		e = e + 1;
	
	para(a = 0 : 2 : paso 1){
		para(b = 0 : 2 : paso 1)
			e = e + 1;
		
		para(c = 0 : 2 : paso 1)
			e = e + 1;
	}
	return e;
}
