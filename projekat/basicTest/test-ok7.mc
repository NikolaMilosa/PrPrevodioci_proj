//Testiranje funkcija sa više parametara
int prva(int a, int b, int c){                  //Više parametara istog tipa
	a = 3;
	b = 5;
	return a;
}
unsigned druga(int a,unsigned b, int c){        //Više parametara različitog tipa
	a = 5;
	b = 3u;
	return b;
}
int main(){
	int a,b,c;
	unsigned d,e,f;
	
	a = prva(a,b,c);
	e = druga(a,e,c);	

	return 0;
}
