# Type a script or drag a script file from your workspace to insert its path.
PATH_TO_GOOGLE_PLISTS="${PROJECT_DIR}/Betzi/Main/Firebase"

case "${CONFIGURATION}" in

   "Debug-Development" | "Release-Development" )    
        cp -r "$PATH_TO_GOOGLE_PLISTS/Dev/GoogleService-Info.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist" ;;

   "Debug-Production" | "Release-Poduction" )
        cp -r "$PATH_TO_GOOGLE_PLISTS/Prod/GoogleService-Info.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist" ;;

    *)
        ;;
esac
