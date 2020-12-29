//Testiranje osnovnih semantičkih provera
unsigned uFunc(int a){
	unsigned var = 3u;
	
	int b;
	
	return var; 
}
int iFunc(unsigned b){
	int var = 4;
	
	var++;

	return var;
}
int main(){
	int a,b,c;
	unsigned e,f,g;
	
	a = 5;       //Provera da li su exp sa leve i desne strane istog tipa
	e = 5u;
	
	a++;         //Provera da li je a prethodno deklarisana
	
	if(a > b)          //Proverava da li su a i b istog tipa kako bi poređenje imalo smisla
		a = iFunc(e);  //Proverava da li je argument e tipa kojeg je parametar b funckije u njenoj definiciji
		               //Takođe, proverava da li je povratni tip iFunc isti kao a

	return 0;
}
