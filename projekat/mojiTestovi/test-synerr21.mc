//Test sintaksnih grešaka kod funkcija sa više promenljivih
int func(int a int b){            //Prijavljuje grešku jer fali zarez
	b = 3;
	return b;
}
int main(){

	int a,b;
	
	a = func(5,2);
	return 0;
	
}
