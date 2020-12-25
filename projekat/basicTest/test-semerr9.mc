//Testiranje semantickih gresaka kod para iskaza

int main(){

	int a,b,c;
	unsigned e,f,g;
	
	para(a = 1 : 5 : paso 2u)         //korak i iterator nisu istog tipa
		b = 3;
		
	para(e = 2u : 5 : paso 3u)        //krajnja vrednost iteratora nije istog tipa kao iterator
		b = 3;
		
	return 0;
}
