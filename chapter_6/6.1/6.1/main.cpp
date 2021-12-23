//
//  main.cpp
//  6.1
//
//  Created by Liam Cannon on 10/14/21.
//
#include <iostream>
extern "C" void asmMain();


using namespace std;

int main() {
    return asmMain();
    
}

void getParam() {
    string paramOne;
    string paramTwo;
    cout << "Enter numbers 1 at a time" << endl;
    cin >> paramOne;
    cin >> paramTwo;
}
