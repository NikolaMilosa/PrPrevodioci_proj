//Testiranje mogucih semantickih gresaka kod visestruke dodele
int func(int a){
	
	int b = 3, c = 5u, d = 2;            //c nije istog tipa kao 5u
 	unsigned e = 3u, k = 4u, f = 5u;     

	a = 5;
	
	return a;
}
int main(){

	unsigned b = func(3), a = 4u;       //b nije istog tipa kao povratna vrednost func

	return 0;
}
