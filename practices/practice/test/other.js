console.log("Greeting to other .js file");
let x=10;
const y=true;
const myObject={
    a:x,
    b:y

};
console.log(myObject);
let myVariable;
console.log(myVariable);
myVariable=10;
console.log(myVariable);
myVariable=true;
console.log(myVariable);
myVariable={
    x:true,
    y:10
};
console.log(myVariable);
const myCity={
    city:"New York",
    popular:true,
    country:"USE"

};
console.log(myCity);
console.log(myCity.city);
let myPost={};
myPost.PostTital="hhhhhhhh";
myPost.postLike=0;
myPost.shared=false;
myPost.postLike=myPost.postLike+1;
delete myPost.shared;
console.log(myPost);

const myObject1={};
myObject1.a=true;
console.log(myObject1);

let myObject2={a:10}
let copymyObject2=myObject2;
copymyObject2.b=false;
console.log(myObject2);
console.log(copymyObject2);

let myObject3={
    a:true,
    b:null,
    c:25
};
console.log(myObject3["a"]);
console.log(myObject3["b"]);

const propertyName="c";
console.log(myObject3[propertyName]);
console.log(myObject3["propertyName"]);

myObject3["new"+ "Property"+"name"]="value of dynamic";
console.log(myObject3);