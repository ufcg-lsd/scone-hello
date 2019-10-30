#include <iostream>
#include <cmath>

using namespace std;

int main() {
    
    char* secret = (char*)"Karate";
    int x = 0;
    while(x < 10) {
        double y = sqrt((double)x);
        cout << "The square root of " << x << " is " << y << endl;
        x++;
    }
    cout << secret << endl;

    do cout << '\n' << "Press a key to continue..."; 
    while (cin.get() != '\n');

    return 0;
}
