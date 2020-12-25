//Testiranje da li postoji prefiksni inkrementni operator
int main(){
	int a,b,c;
	unsigned d,e,f;
	
	++a;         //Nisu podržani ovakvi slučajevi
	++d;
	
	a = ++b + c;  

	return 0;
}
