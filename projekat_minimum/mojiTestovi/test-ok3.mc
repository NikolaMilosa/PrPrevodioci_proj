//Testiranje postinkrementnog operatora
int main(){
	int a,b,c;
	unsigned d,e,f;
	
	a++;			//Moguća upotreba kao statement
	d++;
	
	b = a++ + c;    //Moguća upotreba kao expression
	d = f + e++;
	
	if(a < b++)
		a = 4;

	return 0;
}
