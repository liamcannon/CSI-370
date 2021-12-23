//
//  main.cpp
//  assignment-9
//
//  Created by Liam Cannon on 11/11/21.
//
// Disclaimer #This program will build however, it errors out once it gets the the asm
#include <iostream>
#include <fstream>

using namespace std;

int main() {
    //declaring variables
    int var1 = -1;
    int var2 = -1;
    string fileName;
    string output;
    // read and write streams
    ifstream inStream;
    ofstream outStream;
    
    string encryptFile(ifstream& input);
    string decryptFile(ifstream& input);
    cout << "Would you like to encrypt(1) or decrypt(2)" << endl;
    do{
        cin >> var2;
        if(var2 == 1 || var2 == 2)
            var1 = 0;
        else {
            cout << "Enter a valid choice:" << endl;
        }
    }while(var1 == -1);
    
    cout << "Enter file name: " << endl;
    cin >> fileName;
    
    try {
        inStream.open(fileName);
        //read file error
    } catch (ifstream::failure& e) {
        cout << "Exception Opening File" << endl;
    }
//    calling based on user choice to encrypt or decrypt
    if(var2 == 1) {
        // 1 = encryption, calling encryptfile
        output = encryptFile(inStream);
    }
    else if (var2 == 2) {
        // 2 = decrypt, calling decryption
        output = decryptFile(inStream);
    }
    inStream.close();
    // finished all the reading that was necessary and writing over the file
    outStream.open(fileName);
    //write takes in n characters and size hence .length and output char to str
    outStream.write(output.c_str(), output.length());
    outStream.close();
}

string encryptFile(ifstream& input) {
    char curr;
    char result;
    string output;
    // while not at the end of file
    while(!input.eof()) {
        curr = input.get();
        // this currently throws an error #Thread 1: EXEC_BAD_ACCESS
        if(curr == EOF) {
            break;
        }
        asm("mov %[current], %%eax \n\t "
            "xor $8, %%eax \n\t "
            //"sall $2, %%eax \n\t\"
            "xor $3, %%eax \n\t"
            "rol $4, %%eax \n\t"
            "xor $4, %%eax \n\t"
            "mov %%eax, %[result] \n\t"
            :[result] "=m" (result)
            :[current] "m" (curr)
            : "%eax"
            // dont interact with string inside assembly
        );
        output += result;
    }
    return output;
}

string decryptFile(ifstream& input) {
//  Decrypting file using reverse method of encrypting file
    string curr;
    string output;
    while(!input.eof()) {
        curr = input.get();
        // uses xor, rotating, and attempted bit switching but kept throwing an error
        asm("mov %[current], %%eax \n\t "
            "xor $4, %%eax \n\t"
            "rol $4, %%eax \n\t"
            "xor $3, %%eax \n\t"
            //"salr $2, %%eax \n\t\"
            "xor $8, %%eax \n\t "
            "mov %%eax, %[output] \n\t"
            :[output] "=m" (output)
            :[current] "m" (curr)
        );
        output += output;
    }
    return output;
}
