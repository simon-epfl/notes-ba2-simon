#include <iostream>
#include <string>
#include <vector>
using namespace std;

// Pour simplifier
typedef string Forme   ;
typedef string Couleur ;

class Brique {
private:
    Forme forme;
    Couleur couleur;

public:
    Brique(Forme f, Couleur c) : forme(f), couleur(c) {}

    ostream& afficher(ostream& sortie) const {
        if (couleur != "") {
            sortie << " (" << forme << ", " << couleur << ")";
        } else {
            sortie << forme;
        }
        return sortie;
    }
};

ostream& operator<<(ostream& sortie, const Brique& b) {
    return b.afficher(sortie);
}

class Construction {
    friend class Grader;
    vector<vector<vector<Brique>>> contenu;

public:
    Construction(Brique const& b) : contenu(1, vector<vector<Brique>>(1, vector<Brique>(1, b))) {}

    ostream& afficher(ostream& sortie) const {
        for (int i = contenu.size() - 1; i >= 0; --i) {
            sortie << "Couche " << i + 1 << " :" << endl;
            for (const auto& ligne : contenu[i]) {
                for (const auto& brique : ligne) {
                    sortie << brique;
                }
                sortie << endl;
            }
        }
        return sortie;
    }

    Construction& operator^=(Construction const& autre) {
        auto& base = contenu;
        base.insert(base.end(), autre.contenu.begin(), autre.contenu.end());
        return *this;
    }

    Construction& operator-=(Construction const& autre) {
        if (contenu.size() == autre.contenu.size()) {
            for (size_t i = 0; i < contenu.size(); ++i) {
                for (const auto& ligne : autre.contenu[i]) {
                    contenu[i].push_back(ligne);
                }
            }
        }
        return *this;
    }

    Construction& operator+=(Construction const& autre) {
        for (size_t i = 0; i < autre.contenu.size() && i < contenu.size(); ++i) {
            for (size_t j = 0; j < autre.contenu[i].size() && j < contenu[i].size(); ++j) {
                contenu[i][j].insert(contenu[i][j].end(), autre.contenu[i][j].begin(), autre.contenu[i][j].end());
            }
        }
        return *this;
    }
};

ostream& operator<<(ostream& sortie, const Construction& batiment) {
    return batiment.afficher(sortie);
}

Construction operator^(Construction const& a, Construction const& b) {
    Construction resultat(a);
    resultat ^= b;
    return resultat;
}

Construction operator-(Construction const& a, Construction const& b) {
    Construction resultat(a);
    resultat -= b;
    return resultat;
}

Construction operator+(Construction const& a, Construction const& b) {
    Construction resultat(a);
    resultat += b;
    return resultat;
}

Construction operator*(unsigned int n, Construction const& a) {
    Construction resultat(a);
    for (unsigned int i = 1; i < n; ++i) {
        resultat += a;
    }
    return resultat;
}

Construction operator/(unsigned int n, Construction const& a) {
    Construction resultat(a);
    for (unsigned int i = 1; i < n; ++i) {
        resultat ^= a;
    }
    return resultat;
}

Construction operator%(unsigned int n, Construction const& a) {
    Construction resultat(a);
    for (unsigned int i = 1; i < n; ++i) {
        resultat -= a;
    }
    return resultat;
}

/*******************************************
 * Ne rien modifier après cette ligne.
 *******************************************/

int main()
{
  // Modèles de briques
  Brique toitD("obliqueD", "rouge");
  Brique toitG("obliqueG", "rouge");
  Brique toitM(" pleine ", "rouge");
  Brique mur  (" pleine ", "blanc");
  Brique vide ("                 ", "");

  unsigned int largeur(4);
  unsigned int profondeur(3);
  unsigned int hauteur(3); // sans le toit

  // on construit les murs
  Construction maison( hauteur / ( profondeur % (largeur * mur) ) );

  // on construit le toit
  Construction toit(profondeur % ( toitG + 2*toitM + toitD ));
  toit ^= profondeur % (vide + toitG + toitD);

  // on pose le toit sur les murs
  maison ^= toit;

  // on admire notre construction
  cout << maison << endl;

  return 0;
}
