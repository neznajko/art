                          ////
////////////////////////////////////////////////////////
// This is basically C cos have to figure what functions
// to use for the assembly progs.
# include <cstddef>  // size_t
# include <fcntl.h>  // open
# include <unistd.h> // read
# include <cstdio>   // BUFSIZ, printf etc.
# include <cstdlib>  // atoi
constexpr std::size_t WORD{ 5}; // MIXAL word
char buf[ BUFSIZ];
int getNextWord() {
    static char* cure{ buf};
    if( *cure == '\n') cure++;
    char* next{ cure + WORD};
    char backup{ *next};
    *next = '\0';
    int word = atoi( cure);
    *next = backup; // re-establish
    cure = next;
    return word;
}
////////////////////////////////////////////////////////
struct Node {
    int suck;
    Node* next = nullptr;
    Node( int suck = 0): suck( suck) {}
    void insert( int coin);
    void dmp();
    ~Node();
};
void Node::insert( int coin) {
    Node* n = new Node( coin);
    n->next = this->next;
    this->next = n;
}
Node::~Node() {
    Node* p = this->next;
    while( p) {
        Node* q = p->next;
        p->next = nullptr; // THATS¡
        delete p;
        p = q;
    }
}
void Node::dmp() {
    printf( "COUNT %d SUC: ", this->suck);
    for( Node* p = this->next; p != nullptr; p = p->next) {
        printf( "%d ", p->suck);        
    }
    puts( "");
}
////////////////////////////////////////////////////////
# define COUNT( v) ( top[( v)].suck)
# define QLINK( v) COUNT( v)
int main() {
    int fd = open( "paper.dev", O_RDONLY);
    read( fd, buf, BUFSIZ);
    getNextWord(); // skip
    int n{ getNextWord()};
    Node* top = new Node[ n + 1];
    while( int u = getNextWord()) {
        int v{ getNextWord()};
        COUNT( v)++;
        top[ u].insert( v);
    }
    int R{};
    for( int _{ 1}; _ <= n; _++) {
        if(! COUNT( _)) {
            R = QLINK( R) = _;
        }
    }
    for( int F = QLINK( 0); F; F = QLINK( F)) {
        printf( "%d ", F);
        for( Node* p = top[ F].next; p; p = p->next) {
            if(! --COUNT( p->suck)) {
                R = QLINK( R) = p->suck;
            }
        }
    }
    puts( "");
    delete[] top;
}
////////////////////////////////////////////////////////
// log: - To compile and run type:
// g++ -pedantic topsort.cpp && ./a.out
////////////////////////////////////////////////////////
////                                                ////
