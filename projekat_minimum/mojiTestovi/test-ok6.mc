//Testiranje retrun iskaza i njegovih semantičkih provera
int funcSaPV(){
	int p = 4;
	return p;          //Prolazi normalno i ne prijavljuje upozorenje
}
unsigned funcBezPV(){
	int c = 0;
	return;            //Prijavljuje upozorenje jer funkcija očekuje povratnu vrednost
}
void vFunc(int a){
	int b;             //Prolazi bez return
}
void v2Func(int b){
	return;            //Prolazi i sa return
}
int main(){
	int a,b,c;
	unsigned e,f,g;
	
	a = funcSaPV();    //Provera da li su isti tip povratna vrednost i promenljiva
	e = funcBezPV();

					   //Prijavljuje upozorenje jer funkcija očekuje povratnu vrednost
}
