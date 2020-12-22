//Testiranje sintaksnih gresaka kod check iskaza

int main(){

	int a,b,c;
	unsigned e,f,g;
	
	check (a){                     //pogresne zagrade
		when 1 ->
			a = a + 5;
			finish;
		when 5 ->
			{
				b = 3;
			}
		otherwise ->
			 = a + b;
		}
		
	return 0;
	
}
