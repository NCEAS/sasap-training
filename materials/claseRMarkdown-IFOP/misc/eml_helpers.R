#' Low-level helper for creating EML parties
#'
#' You usually will want to use the high-level functions such as
#'\code{\link{eml_creator}} and \code{\link{eml_contact}} but using this is
#' fine.
#'
#' The \code{userId} argument assumes an ORCID so be sure to adjust for that.
#'
#' @param type (character) The type of party (e.g. 'contact')
#' @param given_names (character) The party's given name(s)
#' @param sur_name (character) The party's surname
#' @param organization (character) The party's organization name
#' @param position (character) The party's position
#' @param email (character) The party's email address(es)
#' @param phone (character) The party's phone number(s)
#' @param address (character) The party's address(es)
#' @param userId (character) The party's ORCID, in format https://orcid.org/WWWW-XXXX-YYYY-ZZZZ
#' @param role (character) The party's role
#'
#' @return An instance of the party specified by the in \code{type} argument
#' @export
#'
#' @examples
#' eml_party("creator", "Test", "User)
#' eml_party("creator", "Bryce", "Mecum", userId = "https://orcid.org/0000-0002-0381-3766")
eml_party <- function(type="associatedParty",
                      given_names=NULL,
                      sur_name=NULL,
                      organization=NULL,
                      position=NULL,
                      email=NULL,
                      phone=NULL,
                      address=NULL,
                      userId=NULL,
                      role=NULL) {
  if (all(sapply(c(sur_name, organization, position), is.null))) {
    stop(call. = FALSE,
         "You must specify at least one of sur_name, organization, or position to make a valid creator")
  }

  party <- new(type)

  # Individual Name
  if (!is.null(sur_name)) {
    party@individualName <- c(eml_individual_name(given_names, sur_name))
  }

  # Organization Name
  if (!is.null(organization)) {
    party@organizationName <- c(new("organizationName", .Data = organization))
  }

  # Position
  if (!is.null(position)) {
    party@positionName <- c(new("positionName", .Data = position))
  }

  # Email
  if (!is.null(email)) {
    party@electronicMailAddress <- new("ListOfelectronicMailAddress", lapply(email, function(x) { new("electronicMailAddress", .Data = x )}))
  }

  # Address
  if (!is.null(address)) {
    # Upgade to a ListOfaddress if needed
    if (is(address, "address")) {
      address <- c(address)
    }

    party@address <- address
  }

  # Phone
  if (!is.null(phone)) {
    # Upgrade to phone is needed
    if (is.character(phone)) {
      phone <- new("ListOfphone", lapply(phone, function(x) as(x, "phone")))
    }

    # Upgade to a ListOfphone if needed
    if (is(phone, "phone")) {
      phone <- c(phone)
    }

    party@phone <- phone
  }

  # userId
  if (!is.null(userId)) {
    # Warn if the userId doesn't look like an ORCID
    if (!grepl("^https:\\/\\/orcid\\.org", userId)) {
      warning(paste0("The provided `userId` of '", userId, "' does not look like an ORCID and the `userId` argument assumes the given `userId` is an ORCID. ORCIDs should be passed in like https://orcid.org/WWWW-XXXX-YYYY-ZZZZ."))
    }

    party@userId <- c(new("userId", .Data = userId, directory = "https://orcid.org"))
  }

  # Role
  if (!is.null(role)) {
    if (type != "associatedParty") {
      stop(call. = FALSE,
           paste0("Setting a role is only valid on an associatedParty, not a ", type, "."))
    }

    party@role <- new("role", .Data = role)
  }

  party
}

#' Create an EML creator
#'
#' See \code{\link{eml_party}} for details.
#'
#' @param ... Arguments passed on to eml_party
#'
#' @return (creator) The new creator
#' @export
#'
#' @examples
#' eml_creator("test", "user", email = "test@user.com")
eml_creator <- function(...) {
  eml_party("creator", ...)
}

#' Create an EML contact
#'
#' See \code{\link{eml_party}} for details.
#'
#' @param ... Arguments passed on to eml_party
#'
#' @return (contact) The new contact
#' @export
#'
#' @examples
#' eml_contact("test", "user", email = "test@user.com")
eml_contact <- function(...) {
  eml_party("contact", ...)
}


#' Create an EML metadataProvider
#'
#' See \code{\link{eml_party}} for details.
#'
#' @param ... Arguments passed on to eml_party
#'
#' @return (metadataProvider) The new metadataProvider
#' @export
#'
#' @examples
#' eml_metadata_provider("test", "user", email = "test@user.com")
eml_metadata_provider <- function(...) {
  eml_party("metadataProvider", ...)
}

#' Create an EML associatedParty
#'
#' See \code{\link{eml_party}} for details.
#'
#' @param ... Arguments passed on to eml_party
#'
#' @return (associatedParty) The new associatedParty
#' @export
#'
#' @examples
#' eml_associated_party("test", "user", email = "test@user.com", role = "Principal Investigator")
eml_associated_party <- function(...) {
  eml_party("associatedParty", ...)
}
#' Create an EML individualName section
#'
#' @param given_names (character) One or more given names.
#' @param sur_name (character) A sur (last) name.
#'
#' @return (individualName) The new individualName section
#' @export
#'
#' @examples
#' eml_individual_name("some", "user)
eml_individual_name <- function(given_names=NULL, sur_name) {
  stopifnot(is.character(sur_name) && nchar(sur_name) > 0)

  # Create <individualName>
  indiv_name <- new("individualName")

  if (!is.null(given_names)) {
    stopifnot(all(sapply(given_names, is.character)))
    stopifnot(all(lengths(given_names) > 0))

    givens <- lapply(given_names, function(given_name) {
      x <- new("givenName")
      x@.Data <- given_name
      x
    })

    indiv_name@givenName <- new("ListOfgivenName", givens)
  }

  indiv_name@surName <- new("surName", .Data = sur_name)

  indiv_name
}
