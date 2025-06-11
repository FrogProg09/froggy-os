int main(){
    const char *message = "Kernel loaded, yaaay!\n";
    char *video = (char *)0xb8000; // VGA text mode video memory
    int i = 0;
    while(message[i] != '\0'){
        video[i * 2] = message[i]; // character
        video[i * 2 + 1] = 0x07; // attribute
        i++;
    }
    while(1){} // halt
    return 0;
}
