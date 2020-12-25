//Testiranje nekih semantičkih grešaka kod void tipa
void func(void a){              //Parametri ne mogu biti tipa void
	a = 5;
}
int main(){
	int a,b,c;
	unsigned e,f,g;
	
	void nemogucaProm;          //Void samo kao tip funkcija, ne kao tip podataka
	
	a = func(5);                //Void nema povratnu vrednost
	
	return 0;
}
