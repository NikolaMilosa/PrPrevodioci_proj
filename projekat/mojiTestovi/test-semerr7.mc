//Testiranje mogućih semantičkih grešaka prilikom funckija sa više promenljivih
void func(int a, void b, int c, unsigned d){           //Tip parametra void ne sme
	return;
}
int prva(int a, int b, int c){
	a = a + b + c;
	return a;
}
unsigned druga(int a, unsigned b, int c){
	a = a + c;
	b = 3u;
	return b;
}
int main(){
	int a,b,c;
	unsigned e,f,g;
	
	a = prva(1,2);        //Nedovoljno parametara prosleđeno
	
	a = prva(1,2,3u);     //Tipovi parametara se ne poklapaju
	
	e = druga(a,e,e);     //Ne poklapaju se tipovi ponovo
	
	return 0;
}
