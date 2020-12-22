//Testiranje retrun iskaza i njegovih semantičkih provera
//RETURN: 0
int funcSaPV(){
	int p = 4;
	return p;          //Prolazi normalno i ne prijavljuje upozorenje
}
unsigned funcBezPV(){
	int c = 0;
	return 2u;            //Prijavljuje upozorenje jer funkcija očekuje povratnu vrednost
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
	
	vFunc(4);
	v2Func(4);
	
	a = funcSaPV();    //Provera da li su isti tip povratna vrednost i promenljiva
	e = funcBezPV();

	return 0;			   //Prijavljuje upozorenje jer funkcija očekuje povratnu vrednost
}
