//Testiranje nekih semantičkih provera prilikom return
int func(int a){      
	return 5u + 3u;       //Provera da li su ista povratna vrednost funkcije i izraza koji se vraća
}
void vFunc(){
	return 6;             //Void ne sme da ima povratnu vrednost
}
int main(){
	int b;
	
	b = 3;	
	
	b = func(b);
	vFunc();
	
	b = vFunc();         //Nije isti povratni tip, a i vFunc je tipa void
	
	return 0;
}
