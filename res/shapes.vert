VARYING vec3 pos;
VARYING vec2 texcoord;
void MAIN()
{
    texcoord = UV0;
    pos = VERTEX;
    POSITION = MODELVIEWPROJECTION_MATRIX * vec4(pos, 1.0);
}