#include <iostream>
#include "Keepler.h"
#define KEEPLER_EMP_NUM 110
  
using namespace std;

class Company {
    private:
      string name;
      unsigned int employees_number;
    public:
      string getName()            { return name; } 
      void   setName(string newName) { name = newName; } 
      unsigned int getEmployeesNumber() { return employees_number; } 
      void   setEmployeesNumber(unsigned int number) { employees_number = number; }
      void show() {
        cout << "Company Name: " << getName() << endl;
        cout << "Employees Number: " << getEmployeesNumber() << endl;
      } 
};

class Geek {
    private:
      string name;
      string status;
    public:
      string getName()            { return name; } 
      void   setName(string newName) { name = newName; } 
      string getStatus()            { return status; } 
      void   setStatus(string newStatus) { status = newStatus; } 

      void   show() {
        cout << "Name: "   << getName() << endl;
        cout << "Status: " << getStatus() << endl;
      }
};

class CitizenK : public Geek {
  public: 
};

class Keepler : public Company {
    private:
      Manifest k_manifest;
      CitizenK team[KEEPLER_EMP_NUM];

      void setManifest(Manifest newManifest) {
        k_manifest = newManifest;
      }
    public:
      Keepler(string defaultName = "The Keepler Company") 
      {
        setName(defaultName);
        setEmployeesNumber(KEEPLER_EMP_NUM);
      }
      Manifest getManifest() {
        return k_manifest;
      }
    bool isCitizenK(Geek person) {
      //TODO:
      return true; 
    }
};


int main() {
    Keepler company = Keepler();
    Geek dani = Geek();
    company.show();
    cout << endl;
    dani.setName("Dani");
    dani.setStatus("HAPPY");
    dani.show();
    cout << endl;

    if (company.isCitizenK(dani)) {
      dani.setStatus("MORE_HAPPY");
      company.setEmployeesNumber(company.getEmployeesNumber() + 1);
      company.show();
      cout << endl;
      dani.show();
      cout << endl;

    }
}
  
