//
//  main.cpp
//  Assignment-8-8.1
//
//  Created by Liam Cannon on 11/2/21.
//

#include <iostream>
using namespace std;

extern "C" void asmMain();

extern "C" double getDouble() {
    double d;
    cin >> d;
    return d;
}

extern "C" void printString(char* s) {
    cout << s;
    return;
}

extern "C" void printDouble(double d) {
    cout << d << endl;
}

// main stub driver
int main() {
    asmMain();
    return 0;
}
