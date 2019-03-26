{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeOperators         #-}

module GenericsTutorial () where

-- in general you're going to need both an input (f) and an output(g)
-- parameter. They both need to be of kind * -> * and then be passed this
-- existentialized x, for dark, unholy reasons known not by humankind.

class GValidate f g where
  gvalidate :: f x -> Maybe (g x)
