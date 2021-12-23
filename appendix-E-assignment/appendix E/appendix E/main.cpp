//
//  main.cpp
//  appendix E
//
//  Created by Liam Cannon on 10/13/21.
//
#include <iostream>
#include <string>

using namespace std;

extern "C" int GetParam() {
	string num;
	cout << "Enter Number" << endl;
	cin >> num;
	return stoi(num);
}

extern "C" void PrintOutput(int output) {
	cout << "Result: " << output << endl;
}


