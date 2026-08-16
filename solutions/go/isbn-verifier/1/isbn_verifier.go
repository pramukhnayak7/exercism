package isbnverifier

func IsValidISBN(isbn string) bool {

    clean := ""
    for _, c := range isbn{
        if c != '-'{
            clean += string(c)
        }
    }

    if len(clean) != 10{
        return false
    }

    sum :=0

    for i, c := range clean{
        var digit int
        if c == 'X'{
            if i !=9 {
                return false
            }
            digit = 10
        }else if c >= '0' && c <= '9'{
            digit = int(c-'0')
            
        } else {
            return false
        }
        sum += digit * (10-i)
    }
    return sum%11 == 0
}
