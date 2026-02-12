module Helper exposing (..)

import Html



-- funciones basicas


add2 : Int -> Int -> Int
add2 x y =
    x + y


add3 : Float -> Float -> Float -> Float
add3 x y z =
    x + y + z


calc : Int -> Int -> (Int -> Int -> Int) -> Int
calc x y operation =
    operation x y



-- languajes


langs : List { name : String, releaseYear : Int, currentVersion : String }
langs =
    [ { name = "Elm"
      , releaseYear = 2012
      , currentVersion = "0.19.1"
      }
    , { name = "Java"
      , releaseYear = 1995
      , currentVersion = "25.0"
      }
    , { name = "Python"
      , releaseYear = 1991
      , currentVersion = "3.14"
      }
    ]


languageNames :
    List { name : String, releaseYear : Int, currentVersion : String }
    -> List String
languageNames languages =
    List.map .name languages



-- estudiante o no estudiante


type alias User =
    { name : String
    , uType : String
    }


onlyStudents : List User -> List String
onlyStudents users =
    List.map
        (\u ->
            if u.uType == "Student" then
                u.name

            else
                ""
        )
        users



-- juegos


type alias Videogame =
    { title : String
    , releaseYear : Int
    , available : Bool
    , downloads : Int
    , genres : List String
    }


videoGames : List Videogame
videoGames =
    [ { title = "Control"
      , releaseYear = 2019
      , available = True
      , downloads = 5000000
      , genres = [ "Action", "Shooter" ]
      }
    , { title = "Ocarina of Time"
      , releaseYear = 1998
      , available = True
      , downloads = 8000000
      , genres = [ "Action", "Adventure" ]
      }
    ]


getVideogameGenres : List Videogame -> List (List String)
getVideogameGenres games =
    List.map .genres games



-- pcs


type alias Computer =
    { ram : String
    , model : String
    , brand : String
    , screenSize : String
    }


myLaptop : Computer
myLaptop =
    { ram = "16GB"
    , model = "XPS 13"
    , brand = "Dell"
    , screenSize = "13"
    }



--------- algo que nos enseño ----------


createListItem : String -> Html.Html msg
createListItem content =
    Html.li [] [ Html.text content ]


aList : List String -> Html.Html msg
aList contents =
    Html.ul [] (List.map createListItem contents)



-- main


main : Html.Html msg
main =
    Html.div []
        [ Html.h1 [] [ Html.text "My laptop" ]
        , Html.div []
            [ aList
                [ "Ram: " ++ myLaptop.ram
                , "Modelo: " ++ myLaptop.model
                , "Marca: " ++ myLaptop.brand
                , "Pulgadas: " ++ myLaptop.screenSize
                ]
            ]
        ]
