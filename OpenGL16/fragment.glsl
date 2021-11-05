#version 450

struct Light
{
    vec3 pos;
    vec3 color;
};

struct Material
{
    vec3 ambient;
    vec3 diffuse;
    vec3 specular;
    float shininess;
};

in vec3 fragNormal;
in vec4 fragPos;

uniform vec3 eyePos;
uniform Light light;
uniform Material material;

out vec4 color;

void main()
{
    // diffuse
    vec3 lightDir = normalize(light.pos - fragPos.xyz);
    vec3 diffuse = max(dot(fragNormal, lightDir), 0.0)*light.color*material.diffuse;

    // specular
    vec3 viewDir = normalize(eyePos - fragPos.xyz);
    vec3 reflDir = reflect(-lightDir, fragNormal);
    vec3 specular = pow(max(dot(viewDir, reflDir), 0.0), material.shininess)*light.color*material.specular;

    color = vec4(material.ambient + diffuse + specular, 1.0);
}
